package HMS;
import java.awt.Color;
import java.awt.Font;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardXYToolTipGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.HorizontalAlignment;
import org.jfree.ui.RectangleEdge;

import java.awt.BasicStroke;

import HMS.controllerDao;
import javax.activation.MimetypesFileTypeMap;

@Controller
public class filedncontroller extends JFrame {
	@Autowired  
	staffControllerDao sdao;
	@Autowired 
	controllerDao dao;
	@Autowired 
	doctControllerDao ddao;
	
	private static final String UPLOAD_DIRECTORY ="c:\\Docs\\";
	private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
	///{path}/{path1}/{path2}/{path3}
	@RequestMapping(value="/downform", method = RequestMethod.GET)
	public void uploadForm(@ModelAttribute("s") Lab s,HttpServletRequest req, HttpServletResponse response)throws Exception {
		String fileno = req.getParameter("location1");
		//String admitdate = "14-11-2017";
		//String Path = "Fileno5a/14-11-2017/doctor.jpg";
		
		 response.setCharacterEncoding("UTF-8");
		/* response.setContentType("image/png");
		 response.setContentType("image/jpeg");
		 response.setContentType("image/jpg");
		 */
		 
		 String ext1 = FilenameUtils.getExtension(req.getParameter("location")); // returns "txt"
		 System.out.println(ext1);
         if(ext1.contentEquals("jpg")){
        	 response.setContentType("image/jpg"); 
         }
         else if(ext1.contentEquals("jpeg")){
        	 response.setContentType("image/jpeg");
         }
         else if(ext1.contentEquals("png")){
        	 response.setContentType("image/png");
         }
         else if(ext1.contentEquals("pdf")){
        	 response.setContentType("application/pdf");
             response.setHeader("Content-Disposition", "inline; filename=\"" + fileno + "\"");
         }
         else if(ext1.contentEquals("xlsx")){
        	 response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
             response.setHeader("Content-Disposition", "inline; filename=\"" + fileno + "\"");
         }
         else if(ext1.contentEquals("doc")){
        	 response.setContentType("application/msword");
             response.setHeader("Content-Disposition", "inline; filename=\"" + fileno + "\"");
         }
         else if(ext1.contentEquals("docx")){
        	 response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
             response.setHeader("Content-Disposition", "inline; filename=\"" + fileno + "\""); 
         }
         else if(ext1.contentEquals("xls")){
        	 response.setContentType("application/vnd.ms-excel");
             response.setHeader("Content-Disposition", "inline; filename=\"" + fileno + "\""); 
         
         }
         else{
        	 
         }
         
		 String fileName = req.getParameter("location");
	       		 BufferedImage image = null;
		 
		
		 FileInputStream fin=new FileInputStream(UPLOAD_DIRECTORY+File.separator+req.getParameter("location"));    
		 BufferedInputStream bin=new BufferedInputStream(fin);    
		 
		/*
		 ServletOutputStream out = response.getOutputStream();
		 BufferedOutputStream bout = new BufferedOutputStream(out);  
		    int ch =0; ;  
		    while((ch=bin.read())!=-1)  
		    {  
		    bout.write(ch);  
		    }  
		    
		    bin.close();  
		    fin.close();  
		    bout.close();  
		    out.close();  
		  */  
		 IOUtils.copy(fin, response.getOutputStream());
		
		
	}
	
	@RequestMapping("/linechart/{Fileno}/{date}")
	public @ResponseBody void  Linechart(@PathVariable String Fileno,@PathVariable String date,@ModelAttribute("h") Hourchart h,HttpServletResponse response)throws Exception {
	dao.getChart(h,Fileno,date);	
	 
	}
	  
	/*
	@RequestMapping("/linechart2/{Fileno}")
	public@ResponseBody void Linechart(@PathVariable String Fileno,@ModelAttribute("h") Hourchart h,HttpServletResponse response)throws Exception,IOException {
		
		String series1 = "2am";
		String series2 = "4am";
		String series3 = "10am";
		String series4 = "2pm";
		String series5 = "4pm";
		String series6 = "10pm";
	 List<Hourchart>list6 = dao.getChart2(h,Fileno);
	 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	
	 for(Hourchart h1:list6){
		
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getAmtgiv()), series1, h1.getDate());
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getAid1()), series2, h1.getDate());
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getDoctord()), series3, h1.getDate());
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getDoctrmks()), series4, h1.getDate());
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getDoctsig()), series5, h1.getDate());
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getOralamt()), series6, h1.getDate());
		 
	 }
	 
	

		//select 6am,date  from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 10am,date from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 2pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 6pm,date  from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 10pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'
		
		
	    
		
	 JFreeChart chart = ChartFactory .createLineChart3D("Health Report","Date","Temperature °C",dataset, PlotOrientation.VERTICAL,true, true, false);
		
	 CategoryPlot plot = chart.getCategoryPlot();
		LineAndShapeRenderer renderer = new LineAndShapeRenderer();
		
		renderer.setSeriesPaint(0, Color.RED);
		renderer.setSeriesPaint(1, Color.GREEN);
		renderer.setSeriesPaint(2, Color.YELLOW);
		renderer.setSeriesPaint(1, Color.BLUE);
		renderer.setSeriesPaint(1, Color.PINK);
		renderer.setSeriesPaint(1, Color.ORANGE);
		
		renderer.setSeriesStroke(0, new BasicStroke(3.0f));
		renderer.setSeriesStroke(1, new BasicStroke(3.0f));
		renderer.setSeriesStroke(2, new BasicStroke(3.0f));
		renderer.setSeriesStroke(3, new BasicStroke(3.0f));
		renderer.setSeriesStroke(4, new BasicStroke(3.0f));
		renderer.setSeriesStroke(5, new BasicStroke(3.0f));
		
		//plot.setRenderer(renderer);
		plot.setBackgroundPaint(Color.CYAN);
		plot.setRangeGridlinesVisible(true);
		plot.setRangeGridlinePaint(Color.BLACK);
		 
		plot.setDomainGridlinesVisible(true);
		plot.setDomainGridlinePaint(Color.BLACK);
		
		plot.setOutlinePaint(Color.BLUE);
		plot.setOutlineStroke(new BasicStroke(2.0f));
		
			ChartPanel chartPanel = new ChartPanel(chart);
			chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
			 ByteArrayOutputStream bos = new ByteArrayOutputStream();
			    ChartUtilities.writeChartAsPNG(bos, chart, 500, 500);

			            response.setContentType("image/png");
			            OutputStream out = new BufferedOutputStream(response.getOutputStream());
			            out.write(bos.toByteArray());
			            out.flush();
			            out.close();
			
			
			
			
		      
		 
			
			JFrame f = new JFrame("Chart");
			
			f.setContentPane(chartPanel);
			f.pack();
			f.setVisible(true);

	}
	*/
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/linechart2/{Fileno}")
	public@ResponseBody void Linechart(@PathVariable String Fileno,@ModelAttribute("h") Hourchart h,HttpServletResponse response)throws Exception,IOException {
		
		String series1 = "Temperature";
		String series2 = "6am";
		String series3 = "10am";
		String series4 = "2pm";
		String series5 = "6pm";
		String series6 = "10pm";
	
		 List<Hourchart>list6 = dao.getChart2(h,Fileno);
	
	DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	
	 for(Hourchart h1:list6){
		
		 dataset.addValue( NumberFormat.getInstance().parse( h1.getAmtgiv()), series1, h1.getDate());
		
		 
	 }
	 
	

		//select 6am,date  from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 10am,date from hourchart2 where fileno = '"+fileno+"' and  tabid = 'Temperature' union all select 2pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 6pm,date  from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature' union all select 10pm,date from hourchart2 where fileno = '"+fileno+"' and tabid = 'Temperature'
		
		
	    
		
	 JFreeChart chart = ChartFactory .createLineChart("Temperature Chart","Date & Time","Temperature °C",dataset, PlotOrientation.VERTICAL,true, true, false);
		
	 CategoryPlot plot = chart.getCategoryPlot();
	 CategoryAxis domainAxis = plot.getDomainAxis();
	 domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);
	 
		LineAndShapeRenderer renderer = new LineAndShapeRenderer();
		
		renderer.setSeriesPaint(0, Color.RED);
		
		
		
		plot.setRenderer(renderer);
		plot.setBackgroundPaint(Color.WHITE);
	
		plot.setRangeGridlinesVisible(true);
		plot.setRangeGridlinePaint(Color.BLACK);
		 
		plot.setDomainGridlinesVisible(true);
		plot.setDomainGridlinePaint(Color.BLACK);
		
		
			
		//plot.setOutlinePaint(Color.BLUE);
		//plot.setOutlineStroke(new BasicStroke(2.0f));
		/*
			ChartPanel chartPanel = new ChartPanel(chart);
			chartPanel.setPreferredSize(new java.awt.Dimension(300, 300));
			chartPanel.setMaximumDrawWidth(1000);
			chartPanel.setMaximumDrawHeight(600);
			
			*/
		
		TextTitle ed = new TextTitle("Note : Temperature reading displays '0', when reading has not been recorded.",new Font("Courier New", Font.PLAIN, 12));
		ed.setPaint(Color.black);
		ed.setPosition(RectangleEdge.BOTTOM);
		ed.setHorizontalAlignment(HorizontalAlignment.LEFT);
		chart.addSubtitle(ed);

		
			 ByteArrayOutputStream bos = new ByteArrayOutputStream();
			    ChartUtilities.writeChartAsPNG(bos, chart, 1300, 480);

			            response.setContentType("image/png");
			            OutputStream out = new BufferedOutputStream(response.getOutputStream());
			            out.write(bos.toByteArray());
			            out.flush();
			            out.close();
			
			
			
			
		      
		 
			
			            JFrame f = new JFrame("Chart");
			/*
			f.setContentPane(chartPanel);
		*/
		//	f.pack();
		//	f.setVisible(true);
			            /* 
					    String fileName = req.getParameter("location");
				        MimetypesFileTypeMap mimetypesFileTypeMap=new MimetypesFileTypeMap();
				        response.setContentType(mimetypesFileTypeMap.getContentType(fileName));
				        response.getOutputStream().write(Files.readAllBytes(Paths.get(fileName)));
					*/	
	}
	
}





	

