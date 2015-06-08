#!/usr/bin/env ruby

block_size = ARGV[0].to_i
value1 = ARGV[1]
value2 = ARGV[2]

value1_length = value1.length
padding_length = block_size - (value1_length % block_size)
padding_char = padding_length.chr
padding = (padding_char * padding_length)
padded_plaintext = value1 + padding

puts "[*] padded_plaintext: #{padded_plaintext.length}"

value1_blocks = padded_plaintext.scan(/.{#{block_size}}/)
value2_blocks = value2.scan(/.{#{block_size*2}}/) unless value2.nil?

value1_blocks.each_with_index do |block,idx|
  print "#{idx}\t#{block}"

  if value2_blocks.nil?
    print "\n"
  else
    print "\t#{value2_blocks[idx]}\n"
  end
end