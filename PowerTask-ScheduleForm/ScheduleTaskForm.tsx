
// ScheduleTaskForm.tsx
import React, { useState } from "react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Select, SelectTrigger, SelectValue, SelectContent, SelectItem } from "@/components/ui/select";
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";

export default function ScheduleTaskForm() {
  const [enabled, setEnabled] = useState(true);

  return (
    <div className="p-4 rounded-2xl shadow-md border w-full max-w-xl mx-auto bg-white dark:bg-black">
      <h2 className="text-xl font-bold mb-4">Schedule New Task</h2>

      <div className="space-y-4">
        <div>
          <Label>Script Name</Label>
          <Input placeholder="e.g., Weekly Backup" />
        </div>

        <div>
          <Label>Script Language</Label>
          <Select>
            <SelectTrigger>
              <SelectValue placeholder="Select Language" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="powershell">PowerShell</SelectItem>
              <SelectItem value="bash">Bash</SelectItem>
            </SelectContent>
          </Select>
        </div>

        <div>
          <Label>Schedule Type</Label>
          <Select>
            <SelectTrigger>
              <SelectValue placeholder="Select Frequency" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="daily">Daily</SelectItem>
              <SelectItem value="weekly">Weekly</SelectItem>
              <SelectItem value="monthly">Monthly</SelectItem>
              <SelectItem value="once">Once</SelectItem>
            </SelectContent>
          </Select>
        </div>

        <div>
          <Label>Execution Time</Label>
          <Input type="time" />
        </div>

        <div>
          <Label>Start Date</Label>
          <Input type="date" />
        </div>

        <div>
          <Label>Repeat Interval</Label>
          <Input placeholder="e.g., every 2 days" />
        </div>

        <div className="flex items-center gap-4">
          <Label>Enable Task</Label>
          <Switch checked={enabled} onCheckedChange={setEnabled} />
        </div>

        <Button className="w-full mt-4">Create Task</Button>
      </div>
    </div>
  );
}
