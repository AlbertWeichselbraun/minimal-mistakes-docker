IMAGE_TAG=albert/semanticlab
HOST_BASE=root@mail.semanticlab.net:/data/service/web

sl:
	docker run --rm=true --network=host --volume="${PWD}/semanticlab.net:/usr/src/app" -it ${IMAGE_TAG}

sl-publish: 
	rsync -av --delete /home/albert/Public/sites/semanticlab.net/_site/ ${HOST_BASE}/semanticlab.net/

blog:
	docker run --rm=true --network=host --volume="${PWD}/blog.semanticlab.net:/usr/src/app" -it ${IMAGE_TAG}

blog-publish: 
	rsync -av --delete /home/albert/Public/sites/blog.semanticlab.net/_site/ ${HOST_BASE}/blog.semanticlab.net/
