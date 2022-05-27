desc 'Generate website files'
task :website_generate do
    (Dir['webite/**/*.txt'] + Dir['website/version.html']).each do |txt|
        sh %{ ./script/text2html #{txt} > #{txt.gsub(/txt$/, '.html')} }
    end
end

desc 'Upload website file to rubyforge'
task :website_upload do
    remote_dir = "/var/www/gforge-projects/friendly"
    local_dir = 'website'
    sh %{rsync -acCv #{local_dir}/ #{ENV['USER']}@rubyforge.org:#{remote_dir}}
end

desc 'Generate and uploada website files'
task :website => [:website_generate, :website_upload, :publish_docs]
