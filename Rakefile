namespace :readme do
  task :generate  do
    `rspec spec --require ./spec/support/formatters/markdown_formatter.rb --format MarkdownFormatter >> README.md`
  end
end
