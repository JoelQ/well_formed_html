module Jasmine
  class Config
    def simple_config_file
      File.join(project_root, 'javascripts/spec/support/jasmine.yml')
    end
  end
end
