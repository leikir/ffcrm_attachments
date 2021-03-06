require 'spec_helper'

describe Attachment do

  describe 'associations' do
    it 'entity-attahment relation' do
      contact = FactoryGirl.create :contact
      attach = FactoryGirl.create :attachment, entity: contact

      expect( contact.attachments.count ).to eq(1)
    end

    it 'dependent destroy' do
      contact = FactoryGirl.create :contact
      attachments = FactoryGirl.create_list :attachment, 3, entity: contact
      expect { contact.destroy }.to change(Attachment, :count).by(-3)
    end
  end

  describe 'instance methods' do
    it 'is_image?' do
      attach = FactoryGirl.create :attachment
      attach.is_image?.should eq(true)
    end

    it 'should return preview image path' do
      attach = FactoryGirl.create :doc_attachment
      expect( attach.to_default_image ).to eq("/assets/ffcrm_attachments/default-doc.png")
    end
  end
end
