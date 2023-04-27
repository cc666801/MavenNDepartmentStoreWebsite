package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto.CompanyCounterDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyCounterService;

@RestController
@RequestMapping("/api/companyCounter")
public class CompanyCounterControllerApi {
    
    @Autowired
    private CompanyCounterService companyCounterService;
    
    // 取得所有資料
    @GetMapping("/")
    public List<CompanyCounterDto> getAll() {
    	List<CompanyCounter> companyCounters = companyCounterService.getAllCompanyCounter();
    	List<CompanyCounterDto> companyCounterDtos = companyCounters.stream()
    	        .map(CompanyCounterDto::new)
    	        .collect(Collectors.toList());
        return companyCounterDtos;
    }
    
    
    // 刪除資料
    @DeleteMapping("/{companyId}/{counterId}/{onCounterTime}")
    public List<CompanyCounterDto> delete(@PathVariable int companyId, @PathVariable int counterId, @PathVariable @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date onCounterTime) {
        CompanyCounterId id = new CompanyCounterId();
        id.setCompanyId(companyId);
        id.setCounterId(counterId);
        id.setOnCounterTime(onCounterTime);
        companyCounterService.deleteCompanyCounterById(id);
        List<CompanyCounter> companyCounters = companyCounterService.getAllCompanyCounter();
    	List<CompanyCounterDto> companyCounterDtos = companyCounters.stream()
    	        .map(CompanyCounterDto::new)
    	        .collect(Collectors.toList());
        return companyCounterDtos;
        
    }
}
