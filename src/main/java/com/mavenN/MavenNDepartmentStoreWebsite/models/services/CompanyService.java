package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.IndustryCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.OpeningHours;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto.CompanyDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.AddressRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CooperationStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.IndustryCategoryRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.OpeningHoursRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private AddressRepository addressRepository;
	@Autowired
	private IndustryCategoryRepository industryCategoryRepository;
	@Autowired
	private CooperationStatusRepository cooperationStatusRepository;
	@Autowired
	private OpeningHoursRepository openingHoursRepository;

	// For getAddCompanyPage()
	public List<Address> findAllAddresses() {
		List<Address> addresses = addressRepository.findAll();
		return addresses;
	}

	public List<IndustryCategory> findAllIndustryCategorys() {
		List<IndustryCategory> industryCategories = industryCategoryRepository.findAll();
		companyRepository.findAll();
		return industryCategories;
	}

	public List<CooperationStatus> findAllCooperationStatuses() {
		List<CooperationStatus> cooperationStatuses = cooperationStatusRepository.findAll();
		return cooperationStatuses;
	}

	public List<OpeningHours> findAllOpeningHourses() {
		List<OpeningHours> openingHourses = openingHoursRepository.findAll();
		return openingHourses;
	}

	public void addCompany(Company company) {
		companyRepository.save(company);
	}
	
	// For showAllCompanys()
	public Page<Company> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "companyId");
		Page<Company> page = companyRepository.findAll(pgb);
		return page;
	}

	// For showEditedCompany()
	public Company findCompanyById(Integer id) {
		Optional<Company> optionalCompany = companyRepository.findById(id);

		if (optionalCompany.isEmpty()) {
			return null;
		}

		return optionalCompany.get();
	}
	// For updateCompany()
	@Transactional
	public Company updateCompanyById(Integer companyId, String companyName, String companyPhone, byte[] companyLogo,
			Address address, IndustryCategory industryCategory, OpeningHours openingHours,
			CooperationStatus cooperationStatus) {
		Optional<Company> option = companyRepository.findById(companyId);

		if (option.isPresent()) {
			Company company = option.get();
			company.setCompanyName(companyName);
			company.setCompanyPhone(companyPhone);
			if (companyLogo != null) {
				company.setCompanyLogo(companyLogo);
			}

			company.setAddress(address);
			company.setIndustryCategory(industryCategory);
			company.setOpeningHours(openingHours);
			company.setCooperationStatus(cooperationStatus);
			return company;
		}
		return null;
	}

	// For deleteCompany()
	public void deleteCompanyById(Integer id) {
		companyRepository.deleteById(id);
	}

	
	// Api
	// For showAllCompaniesApi()
	public Page<CompanyDto> findByPageApi(Integer pageNumber) {
		List<Company> companies = companyRepository.findAll();
		List<CompanyDto> dtoList = companies.stream().map(CompanyDto::new).collect(Collectors.toList());
		Page<CompanyDto> page = new PageImpl<>(dtoList);
		return page;
	}
	
	// For findAllCompanyOnCounter()
	public List<Company> findByCooperationStatus_CooperationStatusName(String cooperationStatusName) {
		return companyRepository.findByCooperationStatus_CooperationStatusName(cooperationStatusName);
	};
	
	// For findCompaniesOnCounterAndFloor()
	public List<Company> findCompaniesByStatusAndFloor(String cooperationStatusName, String counterName) {
		return companyRepository.findCompaniesByStatusAndFloor(cooperationStatusName, counterName);
	};

}
