# frozen_string_literal: true

require 'sketchup'

# Головний модуль плагіна
module ProGran
  # Підключаємо наш менеджер інтерфейсу
  require_relative 'core/ui_manager'

  # Додаємо пункт меню, якщо його ще немає
  unless file_loaded?(__FILE__)
    UI.menu('Plugins').add_item('proGran Конструктор') do
      ProGran::Core::UIManager.show_dialog
    end
    file_loaded(__FILE__)
  end

  # Метод для швидкого перезавантаження плагіна під час розробки
  def self.reload
    original_verbose = $VERBOSE
    $VERBOSE = nil
    # Динамічно завантажуємо всі .rb файли з папки плагіна
    Dir.glob(File.join(File.dirname(__FILE__), '**/*.rb')).each do |file|
      load file
    end
  ensure
    $VERBOSE = original_verbose
    puts 'proGran reloaded!'
  end
end