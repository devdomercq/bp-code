# use s3 for production hosting
unless Rails.env.development?
    Paperclip::Attachment.default_options[:url] = ':s3.us-east-2.amazonaws.com'
    Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id_partition/:style/:filename"
    Paperclip::Attachment.default_options[:s3_host_name] = 's3.us-east-2.amazonaws.com'
  end