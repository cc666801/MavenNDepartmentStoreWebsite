package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyCounterRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CooperationStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CounterRepository;

@Controller
public class CompanyCounterService {

	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private CounterRepository counterRepository;
	@Autowired
	private CooperationStatusRepository cooperationStatusRepository;
	@Autowired
	private CompanyCounterRepository companyCounterRepository;

	// For addCompanyCounter()
	public List<Company> findAllCompanies() {
		List<Company> companies = companyRepository.findAll();
		return companies;
	}

	public List<Counter> findAllCounters() {
		List<Counter> counters = counterRepository.findAll();
		return counters;
	}
	
	public List<Counter> findAllEmptyCounters(){
		List<Counter> emptyCounters = companyCounterRepository.findAllEmptyCounters();
		return emptyCounters;
	};

	public void saveCompanyCounter(CompanyCounter companyCounter) {
		companyCounterRepository.save(companyCounter);
	}
	
	public CooperationStatus findCooperationStatusByCooperationStatusName(String cooperationStatusName) {
	    return cooperationStatusRepository.findByCooperationStatusName(cooperationStatusName);
	}

	// For getAllCompanyCounters()
	public Page<CompanyCounter> findCompanyCountersByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "companyCounterId");
		Page<CompanyCounter> page = companyCounterRepository.findAll(pgb);
		return page;
	}

	// For getAllApi()
	public List<CompanyCounter> getAllCompanyCounter() {
		return companyCounterRepository.findAll();
	}

	// For showEditedCompany()
	public CompanyCounter findById(CompanyCounterId id) {
        Optional<CompanyCounter> companyCounter = companyCounterRepository.findById(id);
        if (companyCounter.isPresent()) {
            return companyCounter.get();
        }
        throw new NoSuchElementException("CompanyCounter with id " + id + " does not exist.");
    }

	// For updateCompanyCounter()
	@Transactional
	public void updateCompanyCounter(CompanyCounter companyCounter) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(companyCounter.getCompanyCounterId().getOnCounterTime());
        cal.add(Calendar.YEAR, companyCounter.getContractTime());
        Timestamp timestamp = new Timestamp(cal.getTimeInMillis());
        companyCounter.setOffCounterTime(timestamp);
        companyCounterRepository.save(companyCounter);
    }
	
	// For deleteApi()
	public void deleteCompanyCounterById(CompanyCounterId id) {
		companyCounterRepository.deleteById(id);
	}
	
	// For findCompanyCounterByCounterFloorApi()
	public List<CompanyCounter> findByCounterFloor(String counterFloor) {
		return companyCounterRepository.findByCounterFloor(counterFloor);
	}
	
	// For findCompaniesByKeywordAndFloorAndIndustryCategory()
		public List<CompanyCounter> findCompaniesByKeywordAndFloorAndIndustryCategory(String companyName, String counterFloor, String industryCategoryId) {
			// 進行相應的處理
		    // 将逗号分隔的字符串转换为列表
		    List<String> counterFloors = Arrays.asList(counterFloor.split(","));
		    List<Integer> industryCategoryIds = Arrays.stream(industryCategoryId.split(","))
		                                              .map(Integer::parseInt)
		                                              .collect(Collectors.toList());
		    // 调用repository方法
		    return companyCounterRepository.findCompanyCountersByKeywordAndFloorAndIndustryCategory(companyName, counterFloors, industryCategoryIds);
		}
		// For findCompaniesOnCounterAndFloor()
		public List<CompanyCounter> findCompaniesByStatusAndFloor(String cooperationStatusName, String counterName) {
			return companyCounterRepository.findCompanyCountersByStatusAndFloor(cooperationStatusName, counterName);
		};
}
