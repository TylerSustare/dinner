namespace :doc do
  desc 'This rake builds the container to run locally'

  task :build do
    sh 'docker build -t dinner .'
  end
  task :run do
    sh 'docker run -p 3000:3000 dinner'
  end
end
