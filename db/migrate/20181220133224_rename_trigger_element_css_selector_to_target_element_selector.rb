class RenameTriggerElementCssSelectorToTargetElementSelector < ActiveRecord::Migration[5.2]
 def change
    rename_column :notices, :trigger_element_css_selector, :target_element_selector
  end
end
