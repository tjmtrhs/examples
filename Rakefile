task default: :cucumber

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |task|
    task.cucumber_opts = '--tags ~@wip'
  end
rescue LoadError
  task :cucumber do
    $stderr.puts 'Cucumber is disabled'
  end
end
