module Ai
  class GeneratePostContent
    def initialize(prompt:)
      @prompt = prompt
    end

    def call
      chat = RubyLLM.chat(model: "gpt-4o-mini")

      prompt = <<~PROMPT
      Sos un asistente experto en escribir contenido breve para un foro anónimo estilo imageboard.
      Tomá el siguiente prompt y generá un post de 3–6 líneas, informal pero interesante.

      prompt: "#{@prompt}"
      PROMPT

      chat.ask(prompt)
    end
  end
end
