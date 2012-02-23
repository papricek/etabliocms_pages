module EtabliocmsPages
  module Admin
    class PagesController < EtabliocmsPages::Admin::BaseController

      def new
        @page = Page.new
      end

      def create
        @page = Page.new(params[:page])
        if @page.save
          flash[:notice] = t('page.updated')
          redirect_to :action => 'index'
        else
          render :action => 'new'
        end
      end

      def edit
        @page = Page.find(params[:id])
      end

      def update
        @page = Page.find(params[:id])
        if @page.update_attributes(params[:page])
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