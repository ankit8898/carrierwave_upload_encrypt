module EncryptorDecryptor
	def encrypt(file)
		user = self.model

		cipher = OpenSSL::Cipher.new 'AES-256-CBC'
		cipher.encrypt
		iv = cipher.random_iv

		user.update_column(:iv, iv )

		pwd = 'This is a secure Password'


		salt = salt_pass =  OpenSSL::Random.random_bytes 16

		user.update_column(:salt, salt)

		iter = 20000

		key_len = cipher.key_len
		digest = OpenSSL::Digest::SHA256.new

		key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
		cipher.key = key


		buf = ""
		File.open("Foola.enc", "wb") do |outf|
			File.open(self.path, "rb") do |inf|
				while inf.read(4096, buf)
					outf << cipher.update(buf)
				end
				outf << cipher.final
			end
		end
	end


	def decrypt(file)
		puts "hereee"
		user = self.model
		cipher = OpenSSL::Cipher.new 'AES-256-CBC'
		cipher.decrypt
		cipher.iv = user.iv # the one generated with #random_iv

		pwd = 'This is a secure Pasrd'
		salt = user.salt #... # the one generated above
		iter = 20000
		key_len = cipher.key_len
		digest = OpenSSL::Digest::SHA256.new

		key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
		cipher.key = key

		buf = ""
		File.open("foodec.pdf", "wb") do |outf|
			File.open("Foola.enc", "rb") do |inf|
				while inf.read(4096, buf)
					outf << cipher.update(buf)
				end
				outf << cipher.final
			end
		end
	end
end
