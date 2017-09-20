def write_to_file
  out_file = open("#{Dir.home}/demo_plots.txt", 'w')
  indata = ''
  FarmInputDemonstrationPlot.all.each do |plot|
    indata << "#{plot.id}*#{plot.description}<>"
  end
  out_file.write(indata)
  out_file.close
end