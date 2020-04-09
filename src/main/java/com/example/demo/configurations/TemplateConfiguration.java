package com.example.demo.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TemplateConfiguration implements WebMvcConfigurer {
	@Bean
	public UrlBasedViewResolver viewResolver() {

		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;

	}
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {
				"/WEB-INF/tiles/tile.xml",
				"/WEB-INF/tiles/tile_admin.xml",
				"/WEB-INF/tiles/tile_home.xml",
				"/WEB-INF/tiles/tile_teacher.xml"				
		});
		return tilesConfigurer;
	}
}
