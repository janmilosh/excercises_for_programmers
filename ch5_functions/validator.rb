class Validate
  def validate_first_name first_name
    if first_name.length == 0
      return 'The first name must be filled in.'
    elsif first_name.length < 2
      return "#{ first_name } is not a valid first name. It is too short."
    end
    false
  end

  def validate_last_name last_name
    if last_name.length == 0
      return 'The last name must be filled in.'
    elsif last_name.length < 2
      return "#{ last_name } is not a valid last name. It is too short."
    end
    false
  end

  def validate_zip_code zip_code
    if zip_code.length == 0
      return 'The ZIP code must be filled in.'
    elsif zip_code.length < 5
      return "#{ zip_code } is not a valid ZIP code. It is too short."
    elsif zip_code.length > 5
      return "#{ zip_code } is not a valid ZIP code. It is too long."
    elsif !zip_code.match /^\d{5}$/
      return "#{ zip_code } is not a valid ZIP code. It must be numeric."
    end
    false
  end

  def validate_employee_id employee_id
    if employee_id.length == 0
      return 'The employee ID must be filled in.'
    elsif !employee_id.match /^[A-Z]{2}-\d{4}$/
      return "#{ employee_id } is not a valid ID."
    end
    false
  end

  def print_result first_name, last_name, zip_code, employee_id
    first_name_msg = validate_first_name first_name
    last_name_msg = validate_last_name last_name
    zip_code_msg = validate_zip_code zip_code
    id_msg = validate_employee_id employee_id

    if first_name_msg
      puts first_name_msg
    end

    if last_name_msg
      puts last_name_msg
    end

    if zip_code_msg
      puts zip_code_msg
    end
    
    if id_msg
      puts id_msg
    end

    if !first_name_msg and !last_name_msg and !zip_code_msg and !id_msg
      puts 'There were no errors found.'
    end
  end

  def prompt text
    print text
    gets.chomp
  end

  def run
    first_name = prompt 'Enter the first name: '
    last_name = prompt 'Enter the last name: '
    zip_code = prompt 'Enter the ZIP code: '
    employee_id = prompt 'Enter an employee ID: '
    print_result first_name, last_name, zip_code, employee_id
  end
end

v = Validate.new
v.run
