class ReportGenerator
  def initialize
    @data = []
  end

  def add_data(item)
    @data << item
  end

  def generate_report(format_type)
    case format_type
    when "pdf"
      generate_pdf
    when "csv"
      generate_csv
    when "html"
      generate_html
    else
      raise "Unsupported format"
    end
  end

  private

  def generate_pdf
    report = "PDF Report\n"
    @data.each do |item|
      report += "#{item}\n"
    end
    report
  end

  def generate_csv
    report = "Data,Value\n"
    @data.each do |item|
      report += "#{item},\n"
    end
    report
  end

  def generate_html
    report = "<html><body><ul>"
    @data.each do |item|
      report += "<li>#{item}</li>"
    end
    report += "</ul></body></html>"
    report
  end
end
