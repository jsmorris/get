namespace :get do
  namespace :test do
    desc 'Run all types of tests for get'
    task :all => [ :test, :spec, :features ] do
    end
  end
end