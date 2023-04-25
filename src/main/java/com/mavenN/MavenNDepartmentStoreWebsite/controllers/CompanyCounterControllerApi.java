package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyCounterRepository;

@RestController
@RequestMapping("/companyCounter")
public class CompanyCounterControllerApi {
    
    @Autowired
    private CompanyCounterRepository repository;
    
    // 取得所有資料
    @GetMapping("/")
    public List<CompanyCounter> getAll() {
        return repository.findAll();
    }
    
//    // 取得特定複合主鍵的資料
//    @GetMapping("/{companyId}/{counterId}/{onCounterTime}")
//    public CompanyCounter getById(@PathVariable int companyId, @PathVariable int counterId, @PathVariable @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date onCounterTime) {
//        CompanyCounterId id = new CompanyCounterId();
//        id.setCompanyId(companyId);
//        id.setCounterId(counterId);
//        id.setOnCounterTime(onCounterTime);
//        return repository.findById(id).orElse(null);
//    }
    
//    // 新增資料
//    @PostMapping("")
//    public CompanyCounter create(@RequestBody CompanyCounter companyCounter) {
//        return repository.save(companyCounter);
//    }
    
//    // 更新資料
//    @PutMapping("/{companyId}/{counterId}/{onCounterTime}")
//    public CompanyCounter update(@PathVariable int companyId, @PathVariable int counterId, @PathVariable @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date onCounterTime, @RequestBody CompanyCounter companyCounter) {
//        CompanyCounterId id = new CompanyCounterId();
//        id.setCompanyId(companyId);
//        id.setCounterId(counterId);
//        id.setOnCounterTime(onCounterTime);
//        if (repository.existsById(id)) {
//            return repository.save(companyCounter);
//        } else {
//            return null;
//        }
//    }
    
    // 刪除資料
    @DeleteMapping("/{companyId}/{counterId}/{onCounterTime}")
    public boolean delete(@PathVariable int companyId, @PathVariable int counterId, @PathVariable @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date onCounterTime) {
        CompanyCounterId id = new CompanyCounterId();
        id.setCompanyId(companyId);
        id.setCounterId(counterId);
        id.setOnCounterTime(onCounterTime);
        if (repository.existsById(id)) {
            repository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }
}
