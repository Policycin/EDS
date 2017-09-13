package com.njust.eds.controller;


import com.njust.eds.model.File;
import com.njust.eds.model.Filedata;
import com.njust.eds.model.User;
import com.njust.eds.service.FileService;
import com.njust.eds.service.FiledataService;
import com.njust.eds.service.UserService;
import com.njust.eds.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static com.njust.eds.utils.AESUtil.*;

/**
 * @author tomato
 * @create 2017-09-05 下午6:07
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;

    @Autowired
    private FiledataService filedataService;

    @ResponseBody
    @RequestMapping("/checkUserName")
    public String checkUserName(HttpServletRequest request) {
        String userName = request.getParameter("userName");
        User user = userService.findUserByUserName(userName);
        if (user != null) {
            return "isExist";
        }
        return "isOK";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "user/register";
    }

    @RequestMapping("/tologin")
    public String tologin() {
        return "user/login";
    }

    @ResponseBody
    @RequestMapping("/register")
    public String register(ModelMap map, HttpServletRequest request) throws Exception {
        String userName = request.getParameter("userName");
        String password = MD5Util.getMD5(request.getParameter("password"));
        String email = request.getParameter("email");
        Date time = new java.sql.Date(new java.util.Date().getTime());
        User user = new User();
        user.setUserName(userName);
        user.setUserPassword(password);
        user.setUserEmail(email);
        user.setUserCreateTime(time);

        //生成序列码、过期日期、用户名字节编码串、未验证:更新currUser
        String serialCode = UUIDUtils.getUUID();
        Date overDate = DateUtils.getDateAfter(7);
        byte[] userNameEncodes = userName.getBytes("UTF-8");

        user.setUserValidateSerCode(serialCode);
        user.setUserValidateOverDate(overDate);
        user.setUserUserNameEncodes(String.valueOf(userNameEncodes));
        user.setUserIsEmailValidated(0);

        userService.saveUser(user);

        //生成URL查询串
        String validateStr = SystemUtils.getProjectURLPath(request) + "/user/validateInfo?email=" + email +
                "&validateSerCode=" + serialCode + "&userNameEncodes=" + String.valueOf(userNameEncodes) + "&type=register";

        //发送邮件
        JavaMailUtils.sendEmail("smtp.qq.com", "1036758468@qq.com", "qxukduhrlyxfbbbi", "1036758468@qq.com",
                new String[]{
                        email
                }, "验证信息-用于注册成功时候的验证", "请点击下面的安全链接,用于验证个人信息<br><a href='" + validateStr + "'>验证信息</a>", "text/html;charset=utf-8");

        return "user/index";
    }

    @ResponseBody
    @RequestMapping("/updateUserPassword/{id}")
    public Map<String, Object> updateUserPassword(ModelMap map, @PathVariable Integer id, HttpServletRequest request) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User user = userService.getUserById(id);
        if (user == null) {
            resultMap.put("updateRes", "no");
        } else {
            String password = MD5Util.getMD5(request.getParameter("password"));
            user.setUserPassword(password);
            userService.updateUser(user);

            resultMap.put("updateRes", "ok");
        }

        return resultMap;
    }

    @RequestMapping("/validateInfo")
    public String validateUserInfo(ModelMap map, HttpServletRequest request) throws Exception {

        String email = request.getParameter("email");
        String validateSerCode = request.getParameter("validateSerCode");
        String userNameEncodes = request.getParameter("userNameEncodes");

        //验证的类型 type=register 表示是注册时候的验证
        String type = request.getParameter("type");

        System.out.println("验证信息: " + " -- " + email + " -- " + validateSerCode + " -- " + userNameEncodes);

        String validateRes = null;
        if (userNameEncodes == null || email == null || validateSerCode == null) {
            validateRes = "链接无效";
        } else {
            Map<String, Object> queryMap = new HashMap<String, Object>();
            queryMap.put("userEmail", email);
            queryMap.put("userValidateSerCode", validateSerCode);
            queryMap.put("userUserNameEncodes", userNameEncodes);

            List<User> userList = userService.findUsers(queryMap);
            if (userList != null && userList.size() > 0) {
                User valiUser = userList.get(0);

                //判断是否已经验证过了!
                if (valiUser.getUserIsEmailValidated() == 1) {
                    validateRes = "该链接已经验证过了!";
                } else {

                    valiUser.setUserIsEmailValidated(1);
                    userService.updateUser(valiUser);

                    if (valiUser.getUserValidateOverDate() != null) {
                        //获取记录,查看链接是否过期
                        if (DateUtils.isBeforeSpeciDate(DateUtils.getCurrentDate(), valiUser.getUserValidateOverDate())) {
                            map.put("valiUser", valiUser);

                            validateRes = "验证成功";
                        } else {
                            validateRes = "链接已失效!";
                        }
                    } else {
                        throw new RuntimeException("系统异常!!!!");
                    }
                }
            } else {
                validateRes = "链接无效";
            }
        }

        map.put("validateRes", validateRes);

        if (type != null && "register".equals(type)) {
            return "user/validateRegister1";
        }
        return "user/validateInfo";
    }

    @ResponseBody
    @RequestMapping("/findPassword")
    public Map<String, Object> findPassword(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User currUser = userService.findUserPassword(request.getParameter("userName"), request.getParameter("email"));
        if (currUser != null) {
            //生成序列码、过期日期、用户名字节编码串、未验证:更新currUser
            String serialCode = UUIDUtils.getUUID();
            Date overDate = DateUtils.getDateAfter(7);
            byte[] userNameEncodes = currUser.getUserName().getBytes("UTF-8");

            currUser.setUserValidateSerCode(serialCode);
            currUser.setUserValidateOverDate(overDate);
            currUser.setUserUserNameEncodes(String.valueOf(userNameEncodes));
            currUser.setUserIsEmailValidated(0);

            userService.updateUser(currUser);

            //生成URL查询串
            String validateStr =
                    SystemUtils.getProjectURLPath(request) + "/user/validateInfo?email=" + currUser.getUserEmail() + "&validateSerCode=" + serialCode + "&userNameEncodes=" + String.valueOf(userNameEncodes) + "";

            //发送邮件
            JavaMailUtils.sendEmail("smtp.qq.com", "1036758468@qq.com", "qxukduhrlyxfbbbi", "1036758468@qq.com",
                    new String[]{
                            currUser.getUserEmail()
                    }, "验证信息-用于找回密码", "请点击下面的安全链接,用于找回密码<br><a href='" + validateStr + "'>找回密码</a>", "text/html;charset=utf-8");

            resultMap.put("res", "yes");
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping("/forgetPassword")
    public String forgetPassword(ModelMap map) {
        return "user/forgetPassword";
    }

    @RequestMapping("/index/{id}")
    public String index(ModelMap map, @PathVariable Integer id) {
        System.out.println(userService.getUserById(id));
        System.out.println("userService.getUserById(id)的值是：---" + userService.getUserById(id) + "，当前方法=UserController.index()");
        map.put("loginUser", userService.getUserById(id));
        return "user/index";
    }

    @ResponseBody
    @RequestMapping("/login")
    public Map<String, Object> userLogin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String password = MD5Util.getMD5(request.getParameter("password"));
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setUserPassword(password);
        User currentUser = userService.queryUser(user);
        if (currentUser != null) {
            resultMap.put("id", currentUser.getUserId());
            resultMap.put("res", "yes");
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping(value = "upload/{userId}", method = RequestMethod.POST)
    public String upload(@PathVariable int userId, @RequestPart(value = "file", required = false)
            MultipartFile file, HttpServletRequest request, ModelMap model) throws Exception {
        if (!file.isEmpty()) {
            File newfile = new File();
            Filedata filedata = new Filedata();
            //获取文件后缀名
            String filename = file.getOriginalFilename();
            String prefix = filename.substring(filename.lastIndexOf(".") + 1);
            //修改后的文件名
            String fileUUIDname = filename.substring(0, filename.lastIndexOf(".") - 1) + UUID.randomUUID().toString();
            //修改后的文件名(带后缀)
            String NewFileName = fileUUIDname + "." + prefix;
            newfile.setFileName(NewFileName);
            newfile.setFileSize(String.valueOf(file.getSize()));
            newfile.setFileLoadTime(new java.sql.Date(new java.util.Date().getTime()));
            newfile.setFileUserId(userId);
            newfile.setFileSecretLevel(Integer.parseInt((request.getParameter("fileSecretLevel") != null) ?
                    request.getParameter("fileSecretLevel") : "1"));
            newfile.setFileAbstrcat((request.getParameter("abstrcat") != null) ?
                    request.getParameter("abstrcat") : "");
            newfile.setFileType(file.getContentType());
            String key = KeyCreate(128);
            newfile.setFileSecretKey(key);
            fileService.addFile(newfile);
            newfile = fileService.findFileByFileName(newfile.getFileName());
            filedata.setFileId(newfile.getFileId());
            filedata.setFileData(aesEncryptToBytes(base64Encode(file.getBytes()), key));
            filedataService.saveFiledata(filedata);
        }
        return "user/index";
    }

    @RequestMapping(value = "/download/{fileId}")
    public ResponseEntity<byte[]> download(HttpServletRequest request,
                                           @PathVariable("fileId") int fileId) throws Exception {
        Filedata filedata = filedataService.getFiledataById(17);
        if (filedata != null) {
            File file = fileService.getFileById(filedata.getFileId());
            String key = file.getFileSecretKey();
            byte[] UNAESFILE = base64Decode(aesDecryptByBytes(filedata.getFileData(), key));
            String filename = file.getFileName();
            HttpHeaders headers = new HttpHeaders();
            //下载显示的文件名，解决中文名称乱码问题
            String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
            //通知浏览器以attachment（下载方式）打开图片
            headers.setContentDispositionFormData("attachment", downloadFielName);
            //application/octet-stream ： 二进制流数据（最常见的文件下载）。
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(UNAESFILE, headers, HttpStatus.CREATED);
        }
        return null;
    }
}