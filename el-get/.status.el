((coffee-mode status "installed" recipe
							(:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
										 (progn
											 (add-to-list 'auto-mode-alist
																		'("\\.coffee$" . coffee-mode))
											 (add-to-list 'auto-mode-alist
																		'("Cakefile" . coffee-mode))
											 (setq coffee-js-mode 'javascript-mode))))
 (color-theme status "installed" recipe
							(:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
										 ("xzf")
										 :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
										 (progn
											 (color-theme-initialize)
											 (setq color-theme-is-global t))))
 (color-theme-railscasts status "installed" recipe
												 (:name color-theme-railscasts :description "Railscasts color theme for Emacs." :type github :pkgname "olegshaldybin/color-theme-railscasts" :depends color-theme :prepare
																(autoload 'color-theme-railscasts "color-theme-railscasts" "color-theme: railscasts" t)))
 (color-theme-solarized status "installed" recipe
												(:name color-theme-solarized :description "Emacs highlighting using Ethan Schoonover's Solarized color scheme" :type github :pkgname "sellout/emacs-color-theme-solarized" :depends color-theme :prepare
															 (progn
																 (add-to-list 'custom-theme-load-path default-directory)
																 (autoload 'color-theme-solarized-light "color-theme-solarized" "color-theme: solarized-light" t)
																 (autoload 'color-theme-solarized-dark "color-theme-solarized" "color-theme: solarized-dark" t))))
 (cssh status "installed" recipe
			 (:name cssh :website "https://github.com/dimitri/cssh" :description "ClusterSSH meets Emacs " :type github :pkgname "dimitri/cssh" :features cssh))
 (ecb status "installed" recipe
			(:name ecb :description "Emacs Code Browser" :type cvs :module "ecb" :url ":pserver:anonymous@ecb.cvs.sourceforge.net:/cvsroot/ecb" :build
						 `(("make" "CEDET=" ,(concat "EMACS="
																				 (shell-quote-argument el-get-emacs))))))
 (el-get status "installed" recipe
				 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (ess status "removed" recipe nil)
 (essh status "installed" recipe
			 (:name essh :auto-generated t :type emacswiki :description "a set of commands that emulate for bash what ESS is to R." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/essh.el"))
 (feature-mode status "installed" recipe
							 (:name feature-mode :description "Major mode for Cucumber feature files" :type github :pkgname "michaelklishin/cucumber.el" :features feature-mode :post-init
											(add-to-list 'auto-mode-alist
																	 '("\\.feature\\'" . feature-mode))))
 (haml-mode status "installed" recipe
						(:name haml-mode :description "Major mode for editing Haml files" :type github :pkgname "nex3/haml-mode"))
 (ibus status "removed" recipe nil)
 (ipython status "installed" recipe
					(:name ipython :description "Adds support for IPython to python-mode.el" :type http :url "https://raw.github.com/ipython/ipython/master/docs/emacs/ipython.el" :depends python-mode :features ipython :post-init
								 (setq py-shell-name "ipython")))
 (markdown-mode status "installed" recipe
								(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :before
											 (add-to-list 'auto-mode-alist
																		'("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (org-mode status "installed" recipe
					 (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
																																																																																																																																																			 (lambda
																																																																																																																																																				 (target)
																																																																																																																																																				 (list "gmake" target
																																																																																																																																																							 (concat "EMACS="
																																																																																																																																																											 (shell-quote-argument el-get-emacs))))
																																																																																																																																																			 '("oldorg"))
									:build `,(mapcar
														(lambda
															(target)
															(list "make" target
																		(concat "EMACS="
																						(shell-quote-argument el-get-emacs))))
														'("oldorg"))
									:load-path
									("." "lisp" "contrib/lisp")
									:autoloads nil :features org-install))
 (pycomplete+ status "removed" recipe nil)
 (pymacs status "removed" recipe nil)
 (python-mode status "installed" recipe
							(:type github :username "emacsmirror" :name python-mode :type emacsmirror :description "Major mode for editing Python programs" :features
										 (python-mode doctest-mode)
										 :compile nil :load "test/doctest-mode.el" :prepare
										 (progn
											 (autoload 'python-mode "python-mode" "Python editing mode." t)
											 (add-to-list 'auto-mode-alist
																		'("\\.py$" . python-mode))
											 (add-to-list 'interpreter-mode-alist
																		'("python" . python-mode)))))
 (redo+ status "removed" recipe nil)
 (rinari status "removed" recipe nil)
 (rope status "installed" recipe
			 (:name rope :description "A python refactoring library" :post-init
							(el-get-envpath-prepend "PYTHONPATH" default-directory)
							:type hg :url "http://bitbucket.org/agr/rope"))
 (ropemacs status "installed" recipe
					 (:name ropemacs :description "An Emacs minor mode for using rope python refactoring library in emacs." :post-init
									(progn
										(unless
												(boundp 'pymacs-load-path)
											(setq pymacs-load-path nil))
										(add-to-list 'pymacs-load-path default-directory))
									:depends
									(rope ropemode)
									:type hg :url "http://bitbucket.org/agr/ropemacs"))
 (ropemode status "installed" recipe
					 (:name ropemode :description "Common parts of ropemacs and ropevim." :post-init
									(progn
										(unless
												(boundp 'pymacs-load-path)
											(setq pymacs-load-path nil))
										(add-to-list 'pymacs-load-path default-directory))
									:type hg :url "http://bitbucket.org/agr/ropemode"))
 (rspec-mode status "installed" recipe
						 (:name rspec-mode :description "Enhance ruby-mode for RSpec" :type github :pkgname "pezra/rspec-mode" :features rspec-mode))
 (rvm status "installed" recipe
			(:name rvm :description "Emacs integration for rvm" :type github :features rvm :pkgname "senny/rvm.el" :compile "rvm.el" :post-init
						 (rvm-use-default)))
 (sass-mode status "installed" recipe
						(:name sass-mode :description "Major mode for editing Sass files" :type github :pkgname "nex3/sass-mode" :depends haml-mode :post-init
									 (add-to-list 'auto-mode-alist
																'("\\.scss$" . sass-mode))))
 (smartrep status "installed" recipe
					 (:name smartrep :description "Support sequential operation which omitted prefix keys." :website "http://sheephead.homelinux.org/2011/12/19/6930/" :type github :pkgname "myuhe/smartrep.el" :features "smartrep"))
 (unicad status "removed" recipe nil)
 (windresize-extension status "removed" recipe nil)
 (xcscope status "installed" recipe
					(:name xcscope :description "Cscope interface for (X)Emacs" :type github :pkgname "To1ne/xcscope" :features xcscope))
 (yaml-mode status "installed" recipe
						(:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :prepare
									 (progn
										 (autoload 'yaml-mode "yaml-mode" nil t)
										 (add-to-list 'auto-mode-alist
																	'("\\.ya?ml\\'" . yaml-mode))))))
