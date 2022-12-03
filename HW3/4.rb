module Context
  NONE, LIST, PARAGRAPH = 0,1,2
end

# actually we need to maintain a stack of contexts, and pop off
# on completion

class BasicOutputter
  def initialize filename
    @line=nil
    @para_beginning = true
    @list_beginning = true
    @bold_beginning = true
    @emphasis_beginning=true
    @filename=filename
    @context=Context::NONE
  end
  def bold
  end
  def emphasis
  end
  def list
  end
  def paragraph
  end
  def heading
  end
  def reset_context
  end
  def process
  end
  def parse
  end
end

# MD to LATEX Praser
class LatexOutputter < BasicOutputter
  def bold
    if @bold_beginning
      print '\\textbf{'
    else
      print '}'
    end
    @bold_beginning = !@bold_beginning
  end

  def emphasis
    if @emphasis_beginning
      print '\\textit{'
    else
      print '}'
    end
    @emphasis_beginning = !@emphasis_beginning
  end

  def list
    print '\\item '
    @line = @line[2..]
    process
  end

  def paragraph
    process
  end

  def heading
    level = 0
    i     = 0
    while @line[i]=='#'
      level = level+1
      i = i+1
    end
    case level
    when 1
      puts "\\part{#{@line[(i+1)..-3]}}"
    when 2
      puts "\\chapter{#{@line[(i+1)..-3]}}"
    when 3
      puts "\\section{#{@line[(i+1)..-3]}}"
    when 4
      puts "\\subsection{#{@line[(i+1)..-3]}}"
    else
      puts "\\subsubsection{#{@line[(i+1)..-3]}}"
    end
    $stdout.flush
  end

  def reset_context
    case @context
    when Context::LIST
      puts "\\end{itemize}"
    when Context::PARAGRAPH
      puts "}"
      @para_beginning = true
    end
  end
  def process
    @line.each_char do |c|
      case c
      when '*'
        bold
      when '/'
        emphasis
      else
        putc c
      end
    end
  end
  def parse
    File.readlines(@filename).each do |text_line|
      if text_line.strip.empty?
        reset_context
        @context = Context::NONE
        next
      end
      @line = text_line
      case @line[0]
      when '#'
        heading
      when '+'
        if @list_beginning == true
          puts "\\begin{itemize}"
          @list_beginning = false
        end
        list
        @context = Context::LIST
      else
        if @context == Context::LIST
          process
          next
        end
        if @para_beginning == true
          puts "\\paragraph{"
          @para_beginning = false
        end
        paragraph
        @context = Context::PARAGRAPH
      end
    end
  end
end

o = LatexOutputter.new "sample.md"
puts ' '
o.parse
