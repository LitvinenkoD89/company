class Employee

	def initialize(first_name, last_name)
		@first_name=first_name
		@last_name=last_name
	end
	
	def first_name=(first_name)
		@first_name = first_name
	end

	def last_name=(last_name)
		@last_name = last_name
	end

	def first_name
		@first_name
	end
	
	def last_name
		@last_name
	end	
end

class Company

	def initialize(title, bik, industry)
		@title = title
		@bik = bik
		@industry = industry
		@employees = Array.new
	end

	def add_new_employee(first_name, last_name)
    key = check_exist_employee(first_name, last_name)

    if key == nil
		  employee = Employee.new(first_name, last_name)
		  @employees.push(employee)
    else
      puts "Employee already exist"
    end
	end

	def show_employees
		@employees.each do |employee|
			puts employee.first_name + ' ' + employee.last_name
		end
	end

	def fire_employee(first_name, last_name)
		key = check_exist_employee(first_name, last_name)

		if key != nil
			@employees.delete_at(key)
		else
			puts "Employee not exist"
		end	
	end

	def check_exist_employee(first_name, last_name)
		return @employees.index{ |employee| employee.first_name == first_name && employee.last_name == last_name }
	end	

	def title
		@title
	end

	def bik
		@bik
	end	

	def industry
		@industry
	end	

	def title=(title)
		@title = title
	end
	
	def bik=(bik)
		@bik = bik
	end	

	def industry=(industry)
		@industry = industry
	end	
end

company = Company.new('test_company', 12313532, 'IT')
company.add_new_employee('Ivanov', 'Ivan')
company.add_new_employee('Ivanov', 'Ivan')
company.add_new_employee('Petrov', 'Petr')
company.show_employees
company.fire_employee('Petrov', 'ivan')
company.fire_employee('Petrov', 'Petr')
company.show_employees
