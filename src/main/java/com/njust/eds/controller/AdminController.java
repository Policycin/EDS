package com.njust.eds.controller;

import com.njust.eds.model.Admin;
import com.njust.eds.model.File;
import com.njust.eds.model.Message;
import com.njust.eds.model.User;
import com.njust.eds.service.*;
import com.njust.eds.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author tomato
 * @create 2017-09-09 下午9:53
 */
@Controller
@RequestMapping("/admin")
//@SessionAttributes("LoginAdminID")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private FiledataService filedataService;


    @ResponseBody
    @RequestMapping("/checkAdminName")
    public String checkAdminName(HttpServletRequest request) {
        String adminName = request.getParameter("adminName");
        Admin admin = adminService.findAdminByAdminName(adminName);
        if (admin != null) {
            return "isExist";
        }
        return "isOK";
    }

    @RequestMapping("/tologin")
    public String tologin() {
        return "admin/login";
    }

    @RequestMapping("/logout")
    public String tologout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("loginAdmin");
        return "admin/login";
    }

    @RequestMapping("/FileControl")
    public String FileControl(ModelMap map) {

        List<List<File>> list = fileService.findUserFiles();
        List<String> namelist=new ArrayList<String>();
         for(List<File> filelist:list)
         {
             if(filelist.size()!=0)
                 namelist.add(userService.findUsernameBuId(filelist.get(0).getFileUserId()));
                else
                    continue;
         }

        List<List<File>> List=new ArrayList<List<File>>();
         for(List<File> filelist:list)
         {
             if(filelist.size()!=0)
             List.add(filelist);
             else
                 continue;
         }
         map.addAttribute("Userfiles",List);
         map.addAttribute("Namelist",namelist);
        return "admin/fileControl";
    }

    @RequestMapping("/UserControl")
    public String UserControl(ModelMap map) {
        List<User> list = userService.getAllUser();
        map.addAttribute("UserList", list);
        return "admin/userControl";
    }

    @RequestMapping("/MessageControl")
    public String MessageControl(ModelMap map, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int id=((Admin)session.getAttribute("loginAdmin")).getAdminId();
        List<Message> messagelist=messageService.findMessagesByRecevierId(id);
        List<String> name=new ArrayList<String>();
        for (Message message:messagelist)
        { int senderid=message.getMsgSender();
            if (senderid<10000)
                name.add(adminService.findAdminnameById(senderid));
        }
        map.addAttribute("Namelist",name);
        map.addAttribute("Messagelist",messagelist);
        return "admin/messageControl";
    }

    @RequestMapping("/PersonalSettings")
    public String PersonalSettings() {
        return "admin/personalSettings";
    }

    @RequestMapping("/SystemInfo")
    public String SystemInfo() {
        return "admin/systemInfo";
    }

    @RequestMapping("/SecretLeveControl")
    public String SecretLeveControl() {
        return "admin/secretLeveControl";
    }

    @RequestMapping("/AdminControl")
    public String AdminControl() {
        return "admin/adminControl";
    }


    @ResponseBody
    @RequestMapping(value = "/DeleteUser")
    public Map<String,String> DeleteUser(HttpServletRequest request) throws  Exception{
        userService.deletUser(userService.getUserById(Integer.parseInt(request.getParameter("userid"))));
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","userControl");
        return resultMap;
    }


    @ResponseBody
    @RequestMapping(value = "/StartUser")
    public void StartUser(HttpServletRequest request) throws  Exception {
        System.out.println(request.getParameter("userid"));
        userService.start(Integer.parseInt(request.getParameter("userid")));
    }

    @ResponseBody
    @RequestMapping(value = "/StopUser")
    public void StopUser(HttpServletRequest request) throws  Exception {
        System.out.println(request.getParameter("userid"));
        userService.stop(Integer.parseInt(request.getParameter("userid")));
    }

    @ResponseBody
    @RequestMapping("/login")
    public Map<String, Object> admin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Admin admin = new Admin();
        String password = MD5Util.getMD5(request.getParameter("password"));
        admin.setAdminName(request.getParameter("adminName"));
        admin.setAdminPassword(password);
        Admin currentAdmin = adminService.queryAdmin(admin);
        if (currentAdmin != null) {
            resultMap.put("LoginAdminID", currentAdmin.getAdminId());
            resultMap.put("res", "yes");
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", currentAdmin);

        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

}
