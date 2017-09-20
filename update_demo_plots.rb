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

def save_translations
  plots = read_from_file
  puts "***"
  puts "Saving translations for the demonstration plots :)"
  puts "***"
  ActiveRecord::Base.transaction do
    plots.each do |plot|
      current_description = plot.split('*')[1]
      demo_plot_id = plot.split('*')[0]
      puts ""
      
      #translations have a unique index on these attributes, just incase it is being run the second time
      trans = Translation.where(item_id: demo_plot_id, item_type: 'FarmInputDemonstrationPlot')
      trans.destroy_all
      
      Translation.create(item_id: demo_plot_id, item_type: 'FarmInputDemonstrationPlot', item_text: current_description, language: 'en')
      Translation.create(item_id: demo_plot_id, item_type: 'FarmInputDemonstrationPlot', item_text: current_description, language: 'sw')
      puts "Saved a translations for the plot with id " + demo_plot_id
      puts ""
    end
  end
end