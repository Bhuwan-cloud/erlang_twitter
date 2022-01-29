defmodule TweetappWeb.PostLive.PostComponent do

  use TweetappWeb, :live_component

  def render(assigns) do
      ~H"""
      <div id="post-{@post.id}" class="post">
      <div class="row">
          <div class="column column-10">
              <div class="post-avatar"> <i class="fas fa-user fa-2x"></i></div>
          </div>
      <div class="column column-90 post-body">
          <b>@<%= @post.username  %></b>
          <br />
          <%= @post.body %>
      </div>
    </div>
    <div id="crud" class="row">
        <div id="like" class="column">
            <a href="#" phx-click="like" phx-target={@myself} >
                <i class="far fa-heart"></i> <%= @post.likes_count %>
                <p>likes</p>
            </a>
        </div>
        <div id="repost" class="column">
            <a href="#" phx-click="repost" phx-target={@myself} >
            <i class="fas fa-recycle"></i> <%= @post.reposts_count %>
                <p>reposts</p>
            </a>
        </div>
        <div id="edit" class="column">
            <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
                <i class="far fa-edit"></i>
                <p>edit</p>
            <% end %>
        </div>

        <div id="show" class="column">
            <%= live_redirect to: Routes.post_show_path(@socket, :show, @post.id) do %>
            <i class="fas fa-info-circle"></i>
                <p>show</p>
            <% end %>
        </div>


        <div id="delete">
            <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure to delete?"] do %>
                <i class="far fa-trash-alt"></i>
                <p> delete </p>
            <% end %>
        </div>


    </div>
    </div>
    """
  end

    def handle_event("like", _, socket) do
        Tweetapp.Timeline.inc_likes(socket.assigns.post)
        {:noreply, socket}
    end

    def handle_event("repost", _, socket) do
        Tweetapp.Timeline.inc_reposts(socket.assigns.post)
        {:noreply, socket}
    end

end
