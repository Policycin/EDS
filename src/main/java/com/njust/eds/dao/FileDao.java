package com.njust.eds.dao;

import com.njust.eds.model.File;

import java.util.List;

public interface FileDao {

    public void saveFile(File file);

    public File queryFile(File file);

    public File findFileById(Integer id);

    public List<File> findFile(List<Object> params, String hql);

    public List<File> findFileByUserId(int userId);

    public void updateFile(File file);

    public File findFileByFileName(String fileName);

    public List<List<File>>findUserFiles();

    public void deletFile(File file);


}
