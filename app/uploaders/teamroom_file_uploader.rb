# encoding: utf-8
require 'openssl'
require 'encryptor_decryptor'

include EncryptorDecryptor
class TeamroomFileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

   before :store, :foo
   after :retrieve_from_store ,:decrypt_file

   # def foo(file)
   #  puts "00000000#{self.path.inspect}"
   #  puts "Triggered After Storing!#{file.inspect} "
    
   # end
  

  def decrypt_file(file)
    decrypt(file)
    puts "------#{self.inspect}"
    puts "------#{self.file.inspect}"
    puts "------#{self.path.inspect}"
    puts "for Decrtyp"
  end


  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

def foo(file)
  encrypt(file)
#  user = self.model

# cipher = OpenSSL::Cipher.new 'AES-256-CBC'
# cipher.encrypt
# iv = cipher.random_iv

# user.update_column(:iv, iv )

# pwd = 'hello'
# salt = salt_pass =  OpenSSL::Random.random_bytes 16

# user.update_column(:salt, salt)

# iter = 20000
# key_len = cipher.key_len
# digest = OpenSSL::Digest::SHA256.new

# key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
# cipher.key = key


# buf = ""
# File.open("foo.enc", "wb") do |outf|
#   File.open(self.path, "rb") do |inf|
#     while inf.read(4096, buf)
#       outf << cipher.update(buf)
#     end
#     puts "------#{outf.inspect}"
#     outf << cipher.final
#   end
# end


# cipher = OpenSSL::Cipher.new 'AES-256-CBC'
# cipher.decrypt
# cipher.iv = iv # the one generated with #random_iv

# pwd = 'hello'
# salt = salt_pass #... # the one generated above
# iter = 20000
# key_len = cipher.key_len
# digest = OpenSSL::Digest::SHA256.new

# key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
# cipher.key = key

# buf = ""
# File.open("anki.pdf", "wb") do |outf|
#   File.open("foo.enc", "rb") do |inf|
#     while inf.read(4096, buf)
#       outf << cipher.update(buf)
#     end
#     outf << cipher.final
#   end
# end

end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
