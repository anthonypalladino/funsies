class ReportGenerator
  FORMATTERS = {
    "pdf" => PdfReportFormatter,
    "csv" => CsvReportFormatter,
    "html" => HtmlReportFormatter
  }

  def initialize
    @data = []
  end

  def add_data(item)
    @data << item
  end

  def generate_report(format_type)
    formatter_class = FORMATTERS[format_type]
    raise "Unsupported format" unless formatter_class

    formatter = formatter_class.new
    formatter.generate_report(self)
  end

  attr_reader :data
end

class AbstractReportFormatter
  def generate_report(report_generator)
    raise NotImplementedError, "Subclasses must implement this method"
  end
end

class PdfReportFormatter < AbstractReportFormatter
  def generate_report(report_generator)
    report = []

    report << "PDF Report\n"
    report_generator.data.each do |item|
      report << "#{item}\n"
    end

    report.join()
  end
end

class CsvReportFormatter < AbstractReportFormatter
  def generate_report(report_generator)
    report = []

    report << "Data,Value\n"
    report_generator.data.each do |item|
      report << "#{item}\n"
    end

    report.join()
  end
end

class HtmlReportFormatter < AbstractReportFormatter
  def generate_report(report_generator)
    report = []

    report << "<html><body><ul>"
    report_generator.data.each do |item|
      report << "<li>#{item}</li>"
    end
    report << "</ul></body></html>"

    report.join()
  end
end
