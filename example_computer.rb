class Computer
  attr_accessor :computer_name_en, :computer_name_jp, :computer_model, :computer_serial_number, :computer_jbbp_id, :computer_os_version, :computer_memory, :computer_year_acquired, :computer_warrenty_expires, :computer_status

  def initializes(attributes = {})
    @computer_name_en = attributes[:computer_name_en]
    @computer_name_jp = attributes[:computer_name_jp]
    @computer_model = attributes[:computer_model]
    @computer_serial_number = attribues[:comoputer_serial_number]
    @computer_jbbp_id = attributes[:coputer_jbbp_id]
    @computer_os_version = attributes[:computer_os_version]
    @computer_memory = attributes[:computer_memory]
    @computer_year_acquired = attributes[:computer_year_acquired]
    @computer_warrenty_expires = attributes[:computer_warrenty_expires]
    @computer_status = attributes[:computer_status]
  end

  def model_and_os
    "#{@computer_model} - #{@computer_os_version}"
  end
end

