Dir.glob("*/**/Rakefile").each { |r| import r }

namespace :dotfiles do
  DOTFILES = Rake::FileList.new("*") do |fl|
    fl.exclude "Rakefile"
    fl.exclude { |f| File.directory? f }
  end

  DOTFILES.each do |f|
    file "#{Dir.home}/.#{f}" => "#{Dir.pwd}/#{f}" do |t|
      FileUtils.ln_s("#{Dir.pwd}/#{f}", t.name)
    end
  end

  desc "installs all dotfiles"
  task :install => DOTFILES.pathmap("#{Dir.home}/.%f")
end

namespace :prepare do
  task :all => :rbenv, :homebrew

  task :rbenv

  task :homebrew
end

desc "run install commands from all Rakefiles found"
task :install_all do
  install_deps = Rake.application.tasks.map do |t|
    t.name.to_sym if t.name.end_with? ":install"
  end.compact

  install_deps.each { |t| Rake::Task[t].invoke }
end
