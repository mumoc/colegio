desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import, [:filename, :model] => [:environment] do |task,args|
  lines = File.new(args[:filename]).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    params = {}
    values = line.strip.split(',')
    keys.each_with_index do |key,i|
      if key.match(/^REL\.(.*)\.(.*)/)
        rel = key.match(/^REL\.(.*)\.(.*)/)[1]
        k = key.match(/^REL\.(.*)\.(.*)/)[2]
        params[rel] = params[rel]|| { 0 => {} }
        params[rel][0][k] = values[i]
      else
        params[key] = values[i]
      end
    end
    Module.const_get(args[:model]).create(params)
  end
end