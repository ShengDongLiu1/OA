package com.ht.service;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Grade;
import com.ht.bean.Student;
import com.ht.dao.BaseDao;

public interface GradeService extends BaseDao<Grade, Integer> {

    public List<Student> batchQlery(Student student);

    public void batchSave(List<Grade> grades);
    
    public List<Classes> classesQlery(int classid);

}
