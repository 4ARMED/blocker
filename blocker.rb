#!/usr/bin/env ruby

block_size = ARGV[0].to_i
value1 = ARGV[1]
value2 = ARGV[2]

value1_blocks = value1.scan(/.{#{block_size*2}}/)
value2_blocks = value2.scan(/.{#{block_size*2}}/) unless value2.nil?

value1_blocks.each_with_index do |block,idx|
  print "#{idx}\t#{block}"

  if value2_blocks.nil?
    print "\n"
  else
    if value2_blocks[idx] == block
      print "\t#{value2_blocks[idx]}\tI\n" 
    else
      print "\t#{value2_blocks[idx]}\tD"
      print "\t#{value2_blocks.index(block)}\n" 
    end
  end
end