class Employee

	def initialize(first_name, last_name)
		setFirstName(first_name)
		setLastName(last_name)
	end
	
	def setFirstName(first_name)
		@first_name = first_name
	end

	def setLastName(last_name)
		@last_name = last_name
	end

	def getFirstName
		return @first_name
	end
	
	def getLastName
		return @last_name
	end	
end

class Company

	def initialize(title, bik, industry)
		_setTitle(title)
		_setBik(bik)
		_setIndustry(industry)
		@employees = Array.new
	end

	def addNewEmployee(first_name, last_name)
		employee = Employee.new(first_name, last_name)
		@employees.push(employee)
	end

	def showEmployees
		
		@employees.each{
			|employee|
			puts employee.getFirstName + ' ' + employee.getLastName
		}
	end

	def fireEmployee(first_name, last_name)
		key = checkExistEmployee(first_name, last_name)

		if key != nil
			@employees.delete_at(key)
		else
			return "Employee not exist"
		end	
	end

	def checkExistEmployee(first_name, last_name)
		employee = Employee.new(first_name, last_name)

		return @employees.index(employee)
	end	

	def getTitle()
		return @title
	end

	def getBik()
		return @bik
	end	

	def getIndustry
		return @industry
	end	

	private 
		def _setTitle(title)
			@title = title
		end
		
		def _setBik(bik)
			@bik = bik
		end	

		def _setIndustry(industry)
			@industry = industry
		end	
end

company = Company.new('test_company', 12313532, 'IT')
company.addNewEmployee('Ivanov', 'Ivan')
company.addNewEmployee('Petrov', 'Petr')
company.showEmployees
company.checkExistEmployee('Ivanov', 'Ivan')
company.fireEmployee('Sidorov', 'Sidor')
company.showEmployees
company.fireEmployee('Ivanov', 'Ivan')
company.showEmployees