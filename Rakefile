namespace :readme do
  task :generate  do
    output = `rspec spec --require ./spec/support/formatters/markdown_formatter.rb --format MarkdownFormatter`
    File.write 'README.md', output
  end
end
