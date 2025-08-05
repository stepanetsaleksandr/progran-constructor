# frozen_string_literal: true

module ProGran
  module Core
    # Цей клас керує створенням та показом діалогового вікна
    class UIManager
      def self.show_dialog
        # Якщо діалог вже відкритий, закриваємо його
        @dialog.close if @dialog&.visible?

        @dialog = UI::HtmlDialog.new(
          dialog_title: 'proGran Конструктор',
          width: 400,
          height: 600,
          resizable: true
        )

        # Знаходимо шлях до нашого HTML файлу
        html_path = File.join(File.dirname(__FILE__), '..', 'web', 'index.html')
        @dialog.set_file(html_path)

        @dialog.center
        @dialog.show
      end
    end
  end
end