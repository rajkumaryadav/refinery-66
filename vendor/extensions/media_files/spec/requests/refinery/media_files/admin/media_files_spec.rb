# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "MediaFiles" do
    describe "Admin" do
      describe "media_files" do
        login_refinery_user

        describe "media_files list" do
          before do
            FactoryGirl.create(:media_file, :title => "UniqueTitleOne")
            FactoryGirl.create(:media_file, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.media_files_admin_media_files_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.media_files_admin_media_files_path

            click_link "Add New Media File"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::MediaFiles::MediaFile.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::MediaFiles::MediaFile.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:media_file, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.media_files_admin_media_files_path

              click_link "Add New Media File"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::MediaFiles::MediaFile.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:media_file, :title => "A title") }

          it "should succeed" do
            visit refinery.media_files_admin_media_files_path

            within ".actions" do
              click_link "Edit this media file"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:media_file, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.media_files_admin_media_files_path

            click_link "Remove this media file forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::MediaFiles::MediaFile.count.should == 0
          end
        end

      end
    end
  end
end
