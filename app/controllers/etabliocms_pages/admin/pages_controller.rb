module EtabliocmsPages
  module Admin
    class PagesController < EtabliocmsCore::Admin::BaseController

      def new
        @page = EtabliocmsPages::Page.new
        @page.build_contents_for_available_locales
      end

      def create
        @page = Page.new(params[:etabliocms_pages_page])
        if @page.save
          flash[:notice] = t('page.created')
          redirect_to :action => 'index'
        else
          @page.build_contents_for_available_locales
          render :action => 'new'
        end
      end

      def edit
        @page = Page.find(params[:id])
      end

      def update
        @page = Page.find(params[:id])
        if @page.update_attributes(params[:etabliocms_pages_page])
          flash[:notice] = t('page.updated')
          redirect_to :action => 'index'
        else
          render :action => 'edit'
        end
      end

      def destroy
        Page.find(params[:id]).destroy
        flash[:notice] = t('page.destroyed')
        redirect_to :action => 'index'
      end

      def move
        @page = Page.find(params[:id])
        if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method])
          @page.send(params[:method])
          flash[:notice] = t('page.moved')
        else
          flash[:notice] = t('page.not_moved')
        end
        redirect_to :action => 'index'
      end

    end
  end
end
