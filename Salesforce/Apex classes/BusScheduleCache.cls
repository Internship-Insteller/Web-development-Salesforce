public class BusScheduleCache {
    
    private Cache.OrgPartition part;
    String partition = 'local.BusSchedule';
    
    // custom constructor
    public BusScheduleCache() {
        Cache.OrgPartition orgPart = new Cache.OrgPartition(partition);
        if(orgPart != null) {
            part = orgPart;
        }
    }
    
    public void putSchedule(String busLine, Time[] schedule) {
        // store values in the org cache using 'part'
        if(part != null) {
            part.put(busLine, schedule);
        }
    }
    
    public Time[] getSchedule(String busLine) {
        // return schedule for the specified bus line using 'part'
        Time[] schedule = new List<Time>();
        
		Object obj = part.get(busLine);
        if(obj != null) {
            // return the value from the org cache if exists
           	schedule.add((Time)obj);
        } else {
        	// logic to handle cache misses
        	schedule = new Time[]{Time.newInstance(8,0,0,0), Time.newInstance(17,0,0,0)};	     
        }
        return schedule;
    }
}