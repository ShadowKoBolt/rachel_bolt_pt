module Formulaic
  module LabelExtensions
    def translate
      I18n.t("helpers.label.#{model_name}.#{attribute}",
             default: '').presence || super
    end
  end
end

Formulaic::Label.send(:prepend, Formulaic::LabelExtensions) if Rails.env.test?
