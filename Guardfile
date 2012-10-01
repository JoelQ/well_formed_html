# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :jasmine, server: :none, jasmine_url: 'http://127.0.0.1:2222/', all_on_start: true do
  watch(%r{javascripts/spec\.(js\.coffee|js|coffee)$}) { 'spec/javascripts' }
  watch(%r{javascripts/.+_spec\.(js\.coffee|js|coffee)$})
  watch(%r{public/javascripts/(.+?)\.(js\.coffee|js|coffee)(?:\.\w+)*$}) { |m| "spec/javascripts/#{ m[1] }_spec.#{ m[2] }" }
end
