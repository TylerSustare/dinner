namespace :aws do
    desc "This rake builds and deploys the app using aws-rails-provisioner"
  
    task :build do
      sh "aws-rails-provisioner build"
    end
    task :deploy do
      sh "aws-rails-provisioner deploy"
    end
  end