package com.mavenN.MavenNDepartmentStoreWebsite;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.IndustryCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.OpeningHours;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.AddressRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CooperationStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CounterRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.IndustryCategoryRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.OpeningHoursRepository;

@Component
public class DataLoader implements CommandLineRunner {

	@Autowired
	private AddressRepository addressRepository;
	@Autowired
	private IndustryCategoryRepository industryCategoryRepository;
	@Autowired
	private CooperationStatusRepository cooperationStatusRepository;
	@Autowired
	private OpeningHoursRepository openingHoursRepository;
	@Autowired
	private CounterRepository counterRepository;

	@Override
	public void run(String... args) throws Exception {
		// 初始化表格 Address, IndustryCategory, CooperationStatus, OpeningHours, Counter 資料
		// Address
		Address address1 = new Address(1, "台南市A區");
		Address address2 = new Address(2, "台北市C區");
		// 裝成 List 存進 Database
		List<Address> addressList = Arrays.asList(address1, address2);
		addressRepository.saveAll(addressList);

		// IndustryCategory
		IndustryCategory industryCategory1 = new IndustryCategory(1, "電子產品");
		IndustryCategory industryCategory2 = new IndustryCategory(2, "餐廳");
		IndustryCategory industryCategory3 = new IndustryCategory(3, "美妝產品");
		// 裝成 List 存進 Database
		List<IndustryCategory> industryCategoryList = Arrays.asList(industryCategory1, industryCategory2,
				industryCategory3);
		industryCategoryRepository.saveAll(industryCategoryList);

		// CooperationStatus
		CooperationStatus cooperationStatus1 = new CooperationStatus(1, "離櫃");
		CooperationStatus cooperationStatus2 = new CooperationStatus(2, "洽談中");
		CooperationStatus cooperationStatus3 = new CooperationStatus(3, "在櫃中");
		// 裝成 List 存進 Database
		List<CooperationStatus> cooperationStatusList = Arrays.asList(cooperationStatus1, cooperationStatus2,
				cooperationStatus3);
		cooperationStatusRepository.saveAll(cooperationStatusList);

		// OpeningHours
		OpeningHours openingHours1 = new OpeningHours(1, "11:00-22:30");
		OpeningHours openingHours2 = new OpeningHours(2, "18:00-22:30");
		// 裝成 List 存進 Database
		List<OpeningHours> openingHoursList = Arrays.asList(openingHours1, openingHours2);
		openingHoursRepository.saveAll(openingHoursList);

		// Counter
		Counter counter1 = new Counter(1, "A", 60000, 50.5, "1F");
		Counter counter2 = new Counter(2, "B", 50000, 40.0, "1F");
		Counter counter3 = new Counter(3, "C", 60000, 50.5, "1F");
		Counter counter4 = new Counter(4, "D", 70000, 60.5, "1F");
		Counter counter5 = new Counter(5, "E", 50000, 40.0, "2F");
		Counter counter6 = new Counter(6, "F", 50000, 40.0, "2F");
		Counter counter7 = new Counter(7, "G", 70000, 62.5, "2F");
		Counter counter8 = new Counter(8, "H", 40000, 30.0, "2F");
		// 裝成 List 存進 Database
		List<Counter> counterList = Arrays.asList(counter1, counter2, counter3, counter4, counter5, counter6, counter7, counter8);
		counterRepository.saveAll(counterList);
	}

}
