module CustomMatchers
  RSpec::Matchers.define :display_notice do |expected|
    match do |flash|
      (flash[:notice] == expected)
    end

    failure_message do |flash|
      "Notice was #{flash[:notice]} but expected: #{expected}"
    end
  end

  RSpec::Matchers.define :display_alert do |expected|
    match do |flash|
      (flash[:alert] == expected)
    end

    failure_message do |flash|
      "Alert was #{flash[:alert]} but expected: #{expected}"
    end
  end
end
