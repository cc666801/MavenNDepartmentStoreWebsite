package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyCounterRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CounterRepository;

@Controller
public class CompanyCounterService {

	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private CounterRepository counterRepository;
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

	public void saveCompanyCounter(CompanyCounter companyCounter) {
		companyCounterRepository.save(companyCounter);
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

}
