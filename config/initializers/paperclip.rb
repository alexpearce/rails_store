Paperclip.interpolates :normalized_basename do |attachment, style|
  basename(attachment, '').gsub( /[^a-zA-Z0-9_]/, '_').downcase
end