require 'json'

class FacilityCreator

    def create_oregon_facilities(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          title: facility_data[:title],
          address: facility_data[:address],
          phone: facility_data[:phone]
          })
      end
    end

    def create_ny_facilities(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          name: facility_data[:name],
          address: facility_data[:address],
          phone: facility_data[:phone]
        })
      end
    end

    def create_mo_facility(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          name: facility_data[:name],
          address: facility_data[:address],
          phone: facility_data[:phone]
        })
      end
    end

    def format_facility_data(facility)
        data = {
        name: format_name(facility),
        address: format_address(facility),
        phone: format_phone_number(facility)
      }
    end

    def format_name(data)
        if data[:website] && data[:website].include?("oregon")
          return data[:title]
        elsif data[:state] && data[:state] == "ny"
          return data[:office_name]
        else data[:state] && data[:state] == "missouri"
          return data[:name]
        end
    end

    def format_address(data)
      if data[:website] && data[:website].include?("oregon")
        address = JSON.parse(data[:location_1][:human_address])
        return "#{address[:address]}, #{address[:city]}, #{address[:zip]}"
      elsif data[:state] && data[:state] == "ny"
        return "#{data[:street_address]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}"
      else data[:state] && data[:state] == "missouri"
        return "#{data[:address]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}"
      end
    end

    def format_phone_number(data)
      if data[:website] && data[:website].include?("oregon")
        data[:phone_number]
      elsif data[:state] && data[:state] == "ny"
        data[:public_phone_number]
      else data[:state] && data[:state] == "missouri"
        data[:phone_number]
      end
    end
end