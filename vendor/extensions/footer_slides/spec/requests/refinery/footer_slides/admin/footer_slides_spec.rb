# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FooterSlides" do
    describe "Admin" do
      describe "footer_slides" do
        login_refinery_user

        describe "footer_slides list" do
          before do
            FactoryGirl.create(:footer_slide, :title => "UniqueTitleOne")
            FactoryGirl.create(:footer_slide, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.footer_slides_admin_footer_slides_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.footer_slides_admin_footer_slides_path

            click_link "Add New Footer Slide"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::FooterSlides::FooterSlide.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::FooterSlides::FooterSlide.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:footer_slide, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.footer_slides_admin_footer_slides_path

              click_link "Add New Footer Slide"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::FooterSlides::FooterSlide.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:footer_slide, :title => "A title") }

          it "should succeed" do
            visit refinery.footer_slides_admin_footer_slides_path

            within ".actions" do
              click_link "Edit this footer slide"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:footer_slide, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.footer_slides_admin_footer_slides_path

            click_link "Remove this footer slide forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::FooterSlides::FooterSlide.count.should == 0
          end
        end

      end
    end
  end
end
