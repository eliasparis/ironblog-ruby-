#blog exsercise @ironhack day1


class Blog

	def initialize
		@post_array = []
		@current_page = 0
		@formated_posts = ""
	end

	def get_post(my_post)
		@post_array.push(my_post)
	end

	def sort_posts
		@post_array.sort! { |a,b| b.date <=> a.date }
	end

	def update_page(user_aswer)
		if user_aswer == "r" 
			@current_page  +=1 unless @current_page > 2
		elsif user_aswer == "l"
			@current_page -=1 unless @current_page <= 0
		end
	end

	def create_front_page 
		self.sort_posts
		first_post_page = @current_page * 4
		final_post_page = first_post_page + 3

		(first_post_page..final_post_page).each do |apost|
			if @post_array[apost].sponsored == true
				@formated_posts += "*****#{@post_array[apost].title}******\n**********\n#{@post_array[apost].text}\n----------\n\n"
			else
				@formated_posts += "#{@post_array[apost].title}\n**********\n#{@post_array[apost].text}\n----------\n\n"
			end
		end
	end

	def publish_front_page
		while true 
			@formated_posts=""
			self.create_front_page
			puts "#{@formated_posts}"
			puts "Current page is #{@current_page + 1}" 
			puts "Press r for next or l for previous page "
			(1..@post_array.length / 4).each do |apage|
				print apage
				end 
			puts""	
			self.update_page(gets.chomp)
		end
	end

end


class Post
	attr_accessor :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end


blog = Blog.new

blog.get_post Post.new("My first blog post",Time.now,"Bla bla bla bla bla bla bla bla at Ironhack", false)
blog.get_post Post.new("My second blog post",(Time.now() +100),"Dddddddddddddddddddddddddddddd at Ironhack", true)
blog.get_post Post.new("My third blog post",(Time.now() +150),"Doooooooooooone at Ironhack", false)
blog.get_post Post.new("My fourth blog post",(Time.now() +180),"Bla bla bla bla bla bla bla bla at Ironhack", false)
blog.get_post Post.new("My fifth blog post",(Time.now() +200),"Dddddddddddddddddddddddddddddd at Ironhack", true)
blog.get_post Post.new("My sixth blog post",(Time.now() +250),"Doooooooooooone at Ironhack", false)
blog.get_post Post.new("My seventh blog post",(Time.now() +280),"Bla bla bla bla bla bla bla bla at Ironhack", false)
blog.get_post Post.new("My eigth blog post",(Time.now() +300),"Dddddddddddddddddddddddddddddd at Ironhack", true)
blog.get_post Post.new("My ninth post",(Time.now() +350),"Doooooooooooone at Ironhack", false)

blog.publish_front_page





