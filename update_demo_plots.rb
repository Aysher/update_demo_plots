def write_to_file
  out_file = open("#{Dir.home}/demo_plots.txt", 'w')
  indata = ''
  FarmInputDemonstrationPlot.all.each do |plot|
    indata << "#{plot.id}*#{plot.description}<>"
  end
  out_file.write(indata)
  out_file.close
end

def read_from_file
  in_file = open("#{Dir.home}/demo_plots.txt")
  indata = in_file.read.to_s
  in_file.close
  indata.split('<>')
end